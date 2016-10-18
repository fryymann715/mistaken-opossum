# mistaken-opossum
Description

Piccadilly Pizza is a diamond in the rough: their deep dish is the bomb dot com, but they're just breaking even because they lack the easy-to-use online ordering interface that will give them a competitive edge.

Your job is to design a schema based on the guidelines Piccadilly Pizza has provided, complete with a programmatic component that allows for basic to CRUD operations on the data.

As a proof of concept, you will first create an E-R diagram that specifies the relationships between these data types, similar to this one. You can use a tool like WWW SQL Designer or MySQL Workbench to create this diagram (here's an example).

Your job is also to provide a basic interface that provides the ability to CRUD the data in each of these tables.
Context

This project will give you experience in designing a robust schema that represents a complex, real-world system as well as an introduction to an ORM without having to worry too much about complex join operations.
Specifications

### Specs

- [] Track all of its customers and any relevant customer information, such as customer ID, name, username/login details, delivery address(es), phone number(s), payment methods on file (e.g., cash, credit, check - if credit, then the card number should also be stored), etc.
- [] Track the ingredients that comprise each of these preferences (e.g., onions, ham, pineapple, anchovies, bacon, etc.)
- [] Track standard drinks, including a product ID, drink description, manufacturer, supplier, price
- [] Track its pizza sizes (small, medium, large, extra large), types (thick or thin crust), ingredients (pepperoni, sausage, mushrooms, onions, cheese, etc.), price data for these pizza sizes and ingredients.
- [] Maintain a history of transactions - all purchases including price, payment method, and delivery date.

Required

    The artifact produced is properly licensed, preferably with the MIT license.

Quality Rubric

    The E-R diagram is fully fleshed out according to spec.
    The E-R diagram includes whether or not each relationship in the schema is is one to one, one to many, or many to many.
    The E-R diagram contains a list of attributes for each entity and relationship
    The E-R diagram contains the SQL data types of each attribute in the schema
    The E-R diagram notes any foreign or primary keys in each table in the schema
    The E-R diagram minimizes data redundancy
    There is a simple interface that allows one to CRUD the data in the specification
    Table names are singular, not plural
