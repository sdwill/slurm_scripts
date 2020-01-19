import socket
import logging

log = logging.getLogger(__name__)
log.info(socket.gethostname())
log.info(socket.gethostname()[:3] == 'bhc')
print(socket.gethostname())