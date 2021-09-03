#!/usr/bin/python3

def capital_case(v):
    """
    permet de passer la première lettre en majuscule
    """
    return v.capitalize()

def test_capital_case():
    resultat = capital_case("adrien vossough")
    assert resultat == 'Adrien vossough'