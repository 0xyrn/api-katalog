"""Basit, nazik HTTP istemcisi. Ağ kapalıysa çökmek yerine None döner."""
from __future__ import annotations

import json
import time
import urllib.error
import urllib.request
from typing import Optional


class NetUnavailable(Exception):
    pass


class NetClient:
    def __init__(self, timeout: int = 12, user_agent: str = "domain-hunter/1.0",
                 rate_delay: float = 0.4):
        self.timeout = timeout
        self.user_agent = user_agent
        self.rate_delay = rate_delay
        self._last_call = 0.0

    def _throttle(self) -> None:
        wait = self.rate_delay - (time.monotonic() - self._last_call)
        if wait > 0:
            time.sleep(wait)
        self._last_call = time.monotonic()

    def get(self, url: str) -> Optional[str]:
        """Metin döndürür. Hata/engel durumunda None (sessiz degrade)."""
        self._throttle()
        req = urllib.request.Request(url, headers={"User-Agent": self.user_agent})
        try:
            with urllib.request.urlopen(req, timeout=self.timeout) as resp:
                charset = resp.headers.get_content_charset() or "utf-8"
                return resp.read().decode(charset, errors="replace")
        except (urllib.error.URLError, urllib.error.HTTPError, TimeoutError, OSError):
            return None

    def get_json(self, url: str):
        body = self.get(url)
        if body is None:
            return None
        try:
            return json.loads(body)
        except (json.JSONDecodeError, ValueError):
            return None
