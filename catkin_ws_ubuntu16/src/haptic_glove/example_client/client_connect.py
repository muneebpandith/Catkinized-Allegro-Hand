
from socket import *
import threading
import src



# connect to server

host_ip = "127.0.0.1"
host_port = 55555
sock = socket(AF_INET, SOCK_STREAM)
sock.connect((host_ip, host_port))
print("connected")

frame_read_worker_i = src.frame_read_worker(sock)
frame_read_worker_t = threading.Thread(target=frame_read_worker_i.worker)
frame_read_worker_t.start()

command_write_worker_i = src.command_write_worker(sock)
command_write_worker_t = threading.Thread(target=command_write_worker_i.worker)
command_write_worker_t.start()

test_worker_t = threading.Thread(target=src.test_worker.test_worker, args=(command_write_worker_i,))
test_worker_t.start()
