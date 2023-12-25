SELECT (SELECT name
          FROM person
          WHERE person_id = person.id
       ) AS person_name
  FROM person_order
  WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND
        order_date = '2022/01/07/';
