from dataclasses import dataclass, field
from typing import Dict

@dataclass
class OrderManagementSystem:

    """ Ein simples Order-Management-System zur Verwaltung von Bestellungen. 
    Jede Bestellung verfügt über eine eindeutige Order-ID sowie einen nummerischen Bestellwert. """

    _orders: Dict[str, float] = field(default_factory=dict)

    # Hinzufügen einer neuen Bestellung
    def add_order(self, order_id: str, order_value: float) -> None:
        # Prüfung der Order-ID 
        if order_id is None or not isinstance(order_id, str) or order_id.strip() == "":
            raise ValueError("Die Order-ID darf nicht leer sein.")
        
        # Prüfung des Bestellwerts
        if isinstance(order_value, bool) or not isinstance(order_value, (int, float)):
            raise TypeError("Der Order-Wert muss eine Zahl sein.")
        
        # Negative Bestellwerte sind nicht erlaubt
        if order_value < 0:
            raise ValueError("Der Order-Wert darf nicht negativ sein.")
        
        # Prüfung auf doppelte Order-IDs
        if order_id in self._orders:
            raise KeyError(f"Bestellung mit ID {order_id} existiert bereits.")
        
        # Speicherung des Bestellwerts als float
        self._orders[order_id] = float(order_value)

    def total_order_value(self) -> float:
        # Berechnung des Gesamtwerts aller Bestellungen
        return float(sum(self._orders.values()))
    
    def count_orders(self) -> int:
        # Gibt die Anzahl der gespeicherten Bestellungen zurück
        return len(self._orders)
    
