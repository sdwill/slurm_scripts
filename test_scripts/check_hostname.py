import socket
import logging

log = logging.getLogger(__name__)
log.info('Hostname:', socket.gethostname())
log.info('First three letters:', socket.gethostname()[:3])
log.info('Is this the same as bhc?', socket.gethostname()[:3] == 'bhc')
