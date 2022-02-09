# Jungle

# Summry

a project done in lighthouse. It was mostly done to emulate a real working environment where we had to implment new features and fixes to inherited code we did not wirte. it was also a chance to learn how to devlope with rails includeing some rails style testing  

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

# Screenshots

## Home page
!["Home page"](https://github.com/joshuavottero/jungle-rails/blob/master/docs/home_page.png)

## Product Details
!["product details"](https://github.com/joshuavottero/jungle-rails/blob/master/docs/product_show_page.png)

## Products sorted by a category
!["products sorted by a category"](https://github.com/joshuavottero/jungle-rails/blob/master/docs/sorted_by_category.png)

## Admin can check categories
!["admin can check categories"](https://github.com/joshuavottero/jungle-rails/blob/master/docs/admin_categories_page.png)

## Admin can create new categories
!["admin can create new categories"](https://github.com/joshuavottero/jungle-rails/blob/master/docs/admin_category_new_page.png)

## Categories after createing new category
!["categories after createing new category"](https://github.com/joshuavottero/jungle-rails/blob/master/docs/admin_categories_page_after.png)

## The users cart after adding some items
!["the users cart after adding some items"](https://github.com/joshuavottero/jungle-rails/blob/master/docs/my_cart_page.png)

## After purchased
!["after purchased"](https://github.com/joshuavottero/jungle-rails/blob/master/docs/order_page.png)

## User loging in
!["user loging in"](https://github.com/joshuavottero/jungle-rails/blob/master/docs/login_page.png)

## After sign in
!["after sign in"](https://github.com/joshuavottero/jungle-rails/blob/master/docs/home_page_signed_in.png)





## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* capybara
* poltergeost
* database_cleaner
* respec-rails
* bcrypt
* bootstrap-sass
* font-awesome-rails
* money-rails
* carrierwave
* rmagick
* stripe
* faker
* puma
* sass-railsxs
* pg
* byebug
* quiet_assets
* dotenv-rails
* web-console
* spring
* newrelic_rpm
* rails_12factor