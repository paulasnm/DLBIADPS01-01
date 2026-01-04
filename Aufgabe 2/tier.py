from dataclasses import dataclass

# Basisklasse
@dataclass
class Tier:
    name: str
    alter: int
    gewicht: float
     

    def fuettern(self, menge: float) -> None:
        """Erhöht das Gewicht des Tieres um die angegebene Futtermenge."""
        if menge <= 0:
            raise ValueError("Die Futtermenge muss größer als 0 sein. Trage bitte eine neue Menge ein.")
        self.gewicht += menge

    
    def beschreibung(self) -> str:
        """Gibt eine kurze, allgemeine Beschreibung des Tieres zurück."""
        return (
            f"Name: {self.name}, Alter: {self.alter} Jahre, "
            f"Gewicht: {self.gewicht:.2f} kg"
        )
    
# Abgeleitete Klasse: Fleischfresser
@dataclass
class Fleischfresser(Tier):
    futter_art_fleisch: str
    futtermenge_tag: float
    gehege_flaeche_m2: float

    def beschreibung(self) -> str:
        base = super().beschreibung()
        return (
            f"{base}, Ernährung: Fleischfresser, "
            f"Futterart: {self.futter_art_fleisch},"
            f"Gehegefläche: {self.gehege_flaeche_m2} m²"
        )
    
# Abgeleitete Klasse: Allesfresser
@dataclass
class Allesfresser(Tier):
    pflanzlicher_anteil_pro_tag: float
    tierischer_anteil_pro_tag: float
    mahlzeiten_pro_tag: int

    def beschreibung(self) -> str:
        base = super().beschreibung()
        return (
            f"{base}, Ernährung: Allesfresser, "
            f"Pflanzlich: {self.pflanzlicher_anteil_pro_tag} %,"
            f"Tierisch: {self.tierischer_anteil_pro_tag} %,"
            f"Mahlzeiten/Tag: {self.mahlzeiten_pro_tag}"
        )
    

# Abgeleitete Klasse: Säugetiere
@dataclass
class Saeugetier(Tier):
    tier_art: str
    sozialverhalten: str
    tragezeit_tage: int

    def beschreibung(self) -> str:
        base = super().beschreibung()
        return (
            f"{base}, Tierart: {self.tier_art}, "
            f"Sozialverhalten: {self.sozialverhalten},"
            f"Tragezeit: {self.tragezeit_tage} Tage"
        )
