import socket

print('Hostname:', socket.gethostname())
print('First three letters:', socket.gethostname()[:3])
print('Is this the same as bhc?', socket.gethostname()[:3] == 'bhc')
