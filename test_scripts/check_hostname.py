import socket
import logging

log = logging.getLogger(__name__)
log.info(socket.gethostname())
print(socket.gethostname())