-- Task 4a: Add a Column
ALTER TABLE mitglied ADD COLUMN telefon TEXT;

-- Task 4b: Add a Named Constraint
-- Standard SQL: 
-- ALTER TABLE buch ADD CONSTRAINT buch_jahr_plausibel CHECK (erscheinungsjahr BETWEEN 1450 AND 2100);
/* SQLite Limitation Workaround for Task 4b:
   SQLite does not support ADD CONSTRAINT via ALTER TABLE. To achieve this, we must:
   1. CREATE TABLE buch_new (...) with the new CHECK constraint included.
   2. INSERT INTO buch_new SELECT * FROM buch;
   3. DROP TABLE buch;
   4. ALTER TABLE buch_new RENAME TO buch;
*/

-- Task 4c: Change a Column Type
-- Standard SQL: 
-- ALTER TABLE exemplar ALTER COLUMN standort SET DATA TYPE VARCHAR(10);
/* SQLite Limitation Workaround for Task 4c:
   SQLite does not support altering a column's data type directly. 
   We must use the exact same 4-step workaround as described in Task 4b: 
   create a new table with the updated column type, copy the data over, drop the old table, and rename the new one.
*/
