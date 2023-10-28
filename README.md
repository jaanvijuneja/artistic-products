# Artistic Products

The Artistic Products project provides an API for querying product details
based on a category, artist, or product name. Additionally, if a valid coupon
is provided, it calculates and offers a discount on the products' price.

## Dependencies

This project depends on:
- `falcon`: For the web server and API creation.
- `pymysql`: To connect and perform operations on a MySQL database.

## Setup

### Database Setup

The code assumes that there is a MySQL database named `aprod` with the tables
`coupons`, `categories`, `products`, and `artists`.

### Configuration

Database configuration like host, database name, username, password, charset,
etc., is hardcoded in the `DBH` object. Before deploying, make sure to set up
your own configurations.

### Installation

To install required libraries, use the following:

```bash
pip install falcon pymysql
```

## API Endpoints

### `POST /`

#### Input

- JSON body containing:
    - `category`: Name of the product category.
    - `artist`: Name of the product artist.
    - `product`: Name of the product.
    - `coupon`: Name of the coupon to apply.

A valid coupon along with either `category`, `artist`, or `product` is mandatory.

#### Output

List of products based on the provided category, artist, or product. Each
product will have its price adjusted based on the discount percent of the
provided coupon.

#### Example

##### Request

```json
{
    "category": "Music",
    "coupon": "SUMMER2023"
}
```

##### Response

```json
[
    {
        "Category": "Music",
        "Artist": "John Doe",
        "Product": "Guitar Solo",
        "Price": 85.0
    },
    ...
]
```

## How It Works

1. The code establishes a connection with the MySQL database using `pymysql`.
2. It defines two SQL queries, one for fetching the discount percent based on a
   given coupon and the other for fetching products.
3. When a POST request is received, the code first checks for the validity of
   the parameters provided.
4. Then, it fetches the discount percent associated with the coupon.
5. Following that, it queries the products based on the criteria provided in
   the request.
6. Finally, it calculates the discounted price for each product and returns the
   list of products.
