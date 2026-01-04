import pytest
from order_management import OrderManagementSystem

# ---- Tests ----
def test_add_valid_order():
    oms = OrderManagementSystem()
    oms.add_order("A1", 5)
    assert oms.total_order_value() == 5.0
    assert oms.count_orders() == 1


def test_add_order_value_zero():
    # Randfall: 0 ist erlaubt und muss korrekt verarbeitet werden
    oms = OrderManagementSystem()
    oms.add_order("FREE", 0)
    assert oms.total_order_value() == 0.0
    assert oms.count_orders() == 1


def test_sum_multiple_orders():
    oms = OrderManagementSystem()
    oms.add_order("A1", 10)
    oms.add_order("A2", 7.8)
    oms.add_order("A3", 0)
    assert oms.total_order_value() == pytest.approx(17.8)
    assert oms.count_orders() == 3

def test_order_value_empty_zero():
    oms = OrderManagementSystem()
    assert oms.total_order_value() == 0.0
    assert oms.count_orders() == 0


def test_value_negative_order():
    oms = OrderManagementSystem()
    with pytest.raises(ValueError):
        oms.add_order("NEGATIVE", -100)


def test_duplicate_order_id_raises_keyerror():
    oms = OrderManagementSystem()
    oms.add_order("A1", 10)
    with pytest.raises(KeyError):
        oms.add_order("A1", 5)


def test_value_empty_order():
    oms = OrderManagementSystem()
    with pytest.raises(ValueError):
        oms.add_order("", 10)


def test_order_value_non_numeric_typeerror():
    oms = OrderManagementSystem()
    with pytest.raises(TypeError):
        oms.add_order("BAD", "12.80")


def test_order_id_whitespace():
    oms = OrderManagementSystem()
    with pytest.raises(ValueError):
        oms.add_order("  ", 10)


def test_order_value_bool_is_rejected():
    # bool wird als Untertyp von int ausgeschlossen
    oms = OrderManagementSystem()
    with pytest.raises(TypeError):
        oms.add_order("BOOL", True)
