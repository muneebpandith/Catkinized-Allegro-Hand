from proto_util import message_frame_pb2 as frame
import queue


class frame_read_worker:
    def __init__(self, sock):
        self.sock = sock
        self.frame_queue = queue.Queue()
        # self.client_mes = client_message()  # TODO

    def read_payload_to_frame(self):
        bytes_to_read = self.sock.recv(4)
        bytes_length = int.from_bytes(bytes_to_read, "little")
        message = self.sock.recv(bytes_length)
        new_frame = frame.Frame()
        new_frame.ParseFromString(message)
        return new_frame

    def worker(self):
        while True:
            try:
                new_frame = self.read_payload_to_frame()
                self.frame_queue.put(new_frame)  # put it into a queue for use
                print(new_frame)
            except Exception as e:
                print("Exception", e)
