# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

A user can browse, view, select, and purchase products. An admin can create new products and new categories as desired. Products that are out of stock will display a "Sold Out!" badge.

## Screenshots

- Home page
!["Screenshot of home page"](https://github.com/davidteng95/jungle-rails/blob/master/docs/home_page.png?raw=true)

- Shows if products are sold out or not on home page
!["Screenshot of home page bottom"](https://github.com/davidteng95/jungle-rails/blob/master/docs/home_page_bottom.png?raw=true)

- Select a product to view its product details
!["Screenshot of product details"](https://github.com/davidteng95/jungle-rails/blob/master/docs/product_detail.png?raw=true)

- Products that are added to cart
!["Screenshot of cart"](https://github.com/davidteng95/jungle-rails/blob/master/docs/my_cart.png?raw=true)

- Order confirmation after placing an order
!["Screenshot of order confirmation"](https://github.com/davidteng95/jungle-rails/blob/master/docs/order_summary.png?raw=true)

- Admin page for products
!["Screenshot of admin products"](https://github.com/davidteng95/jungle-rails/blob/master/docs/admin_product.png?raw=true)

- Admin page for categories
!["Screenshot of admin categories"](https://github.com/davidteng95/jungle-rails/blob/master/docs/admin_category.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
