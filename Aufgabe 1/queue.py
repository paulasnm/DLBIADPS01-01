from enum import Enum 
from collections import deque

class Operation(Enum):
    ADD = "add"
    DELETE = "delete"

"""a) Implementierung mit Array"""
def request_array_process(requests):
    array = []
    for operation, value in requests:
        if operation == Operation.ADD:
            array.append(value)    # O(1)
        elif operation == Operation.DELETE and array: 
            array.pop(0)    # O(n)
    return array 


"""b) Implementierung mit FIFO-Datenstruktur"""

def request_fifo_process(requests):
    queue = deque()
    for operation, value in requests:
        if operation == Operation.ADD:
            queue.append(value)     # O(1)
        elif operation == Operation.DELETE and queue:
            queue.popleft()     # O(1)
    return list(queue)

