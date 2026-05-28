PRAGMA foreign_keys = ON;

BEGIN;
-- الخطوة 1: التحقق من توفر الكتاب (لا توجد إعارة مفتوحة)
SELECT COUNT(*) AS open_loans
FROM   ausleihe
WHERE  exemplar_id = 5
  AND  rueckgabe_datum IS NULL;

-- الخطوة 2: تسجيل الإعارة (بناءً على أن النتيجة السابقة كانت صفر)
INSERT INTO ausleihe (ausleihe_id, exemplar_id, mitglied_id, ausleihe_datum)
VALUES (5, 5, 3, CURRENT_DATE);

COMMIT;
