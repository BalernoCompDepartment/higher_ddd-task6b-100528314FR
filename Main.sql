/* do not change the following two lines! */
.header on
.mode column
/* do not change the above two lines! */


/*Task One: List the name of each product included in order 20006 with its price and the quantity ordered. The order number and total cost of each item should be shown.*/

SELECT product.name, product.price, orderProduct.quantity, orderProduct.orderNumber, ROUND(product.price*orderproduct.quantity,2) AS "Total cost" FROM product, orderProduct WHERE product.productID = orderProduct.productID AND orderProduct.orderNumber = "20006" GROUP BY product.name;

/*Task Two: List all of the products supplied by the supplier called ‘Fun and Games’. The listing should show the name of each product together with its price and discounted price (Fun and Games plans to offer a seasonal discount of 10% on all of its products). */

SELECT product.name, product.price, ROUND(product.price*0.9,2) AS "Discounted price" FROM product, supplier WHERE product.supplierID = supplier.supplierID AND supplier.name = "Fun and Games" GROUP BY product.name;

 /*Task Three: List each of the products included in order 20007 with its productID and quantity ordered. The query should show the increased quantity should the customer increase the quantity of all ‘bean bag’ products in the order by 20. */

SELECT product.name, product.productID, orderProduct.quantity, orderProduct.quantity + 20 AS "Quanity plus 20" FROM product, orderProduct WHERE product.productID = orderProduct.productID AND orderProduct.orderNumber = "20007" AND product.name LIKE "%bean bag%" GROUP BY product.name;

/*Task Four: The shop called ‘The Toy Shop’ wants to increase the number of each type of bean bag in its order by 25.*/
/*Use a query to list the name of the shop with the name of its contact person, the original quantity, price, description and the updated quantity of all bean bags in the order. */

SELECT customer.shopName, customer.contactName, orderProduct.quantity, product.price, product.description, orderproduct.quantity + 25 AS "Increased quantity" 
FROM customer, orderProduct, product, customerOrder 
WHERE customer.customerID = customerOrder.customerID AND customerOrder.orderNumber = orderproduct.orderNumber AND orderproduct.productID = product.productID AND product.name LIKE "%bean bag%" AND customer.shopName = "The Toy Store" 
GROUP BY product.name;

 