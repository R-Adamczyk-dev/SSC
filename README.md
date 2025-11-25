# SSC Master – Zadanie rekrutacyjne (Flutter Developer)

Aplikacja do zarządzania fakturami zakupowymi – w pełni zgodna z dostarczoną specyfikacją.

## Zrealizowane wymagania

### Formularz faktury

- Pola dokładnie zgodnie ze specyfikacją:
  - Nr faktury \*
  - Nazwa kontrahenta \*
  - Kwota netto \* (walidacja: liczba > 0)
  - Stawka VAT (0%, 7%, 23%)
  - Kwota brutto – automatycznie przeliczana (netto × (1 + VAT))
  - Załącznik (PDF lub zdjęcie) z podglądem i możliwością otwarcia
- Walidacja pól wymaganych oraz kwoty netto
- Zapis i edycja faktur

### Lista faktur

- Wyświetlanie wszystkich zapisanych faktur
- Wyszukiwanie po numerze faktury i nazwie kontrahenta
- Możliwość edycji i usunięcia faktury
- Podgląd załącznika bezpośrednio z listy

### Dodatkowe elementy

- Trwałość danych: Isar (lokalna baza NoSQL)
- Nawigacja: go_router
- Dependency Injection: get_it + injectable
- Architektura: Clean Architecture (warstwy: presentation → domain → data)
- Logo SSC Master jako ikona aplikacji oraz w AppBarze
- Responsywny, estetyczny interfejs

## Technologie

- Flutter 3.24+
- Dart 3.5+
- Bloc / Cubit – zarządzanie stanem
- Isar – lokalna baza danych
- go_router – nawigacja
- injectable + get_it – wstrzykiwanie zależności
- open_filex – otwieranie załączników
