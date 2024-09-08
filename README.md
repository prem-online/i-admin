# **E-Commerce Management App (I-Admin)**

This Ruby on Rails application provides an interface for managing categories, products, and tracking customer orders. The app uses **ActiveAdmin** to offer an admin interface, enabling easy management of categories, products, and orders.

## **Features**

- **Category Management**: Add, edit, and delete product categories.
- **Product Management**: Add, update, and remove products linked to specific categories.
- **Order Tracking**: View and manage customer orders, including tracking details.

## **Tech Stack**

- **Ruby on Rails**: Backend framework.
- **ActiveAdmin**: Admin panel for managing data.
- **SQLite3**: Database management system.
- **ActiveRecord**: ORM for database interactions.
- **Devise**: For user authentication (optional).

## **Setup Instructions**

### **Prerequisites**

Ensure you have the following installed:

- Ruby (version 3.1.2)
- Rails (version 7.0.8)
- SQLite3
- Bundler

### **Installation Steps**

1. **Clone the repository**:
   ```bash
   git clone git@github.com:prem-online/i-admin.git
   cd i-admin
   ```
2. **Install dependencies**:
   ```bash
   bundle install
   ```
3. **Set up the database**: SQLite3 is used as the default database. Run the following command to set up the database:
   ```bash
   rails db:create
   rails db:migrate
   ```
4. **Seed the database** (Mandatory): Populate the database with some sample data:
   ```bash
   rails db:seed
   ```
5. **Run the Rails server**: Start the server and navigate to `localhost:3000`:
   ```bash
   rails server
   ```
### **Admin Interface Access**

To access the **ActiveAdmin** interface, navigate to `/admin` and log in using the default admin credentials. You can update these credentials by editing the seed file or through the admin panel.

- URL: `http://localhost:3000/admin`
- Default Admin: admin@example.com
- Default Password: `password`
You can change the admin credentials by editing the `db/seeds.rb` file and running:
```bash
  rails db:seed
```

### **Main Functionalities**

**Category Management**
- Add, edit, or delete product categories via the admin panel.
- Each product can be linked to a category.

**Product Management**
- Admins can create, update, or delete products.
- Products have attributes such as name, price, description, stock, and category association.
**Order Tracking**
- Admins can track customer orders.
- View order details such as product quantity, total amount, and order status.