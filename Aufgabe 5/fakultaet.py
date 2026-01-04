def fakultaet(n: int) -> int:
    if n < 0:
        raise ValueError("Bitte tragen Sie für n eine Zahl ein, welche größer als oder gleich 0 beträgt.")

    result = 1
    for i in range(1, n + 1):
        result *=i
    return result
