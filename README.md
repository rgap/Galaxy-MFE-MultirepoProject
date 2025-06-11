# Microfrontend Multirepo Demo

## 🏗️ Architecture Overview

This project implements a Microfrontend (MFE) Multirepository Architecture using React only, where each application can be developed, deployed, and maintained independently.

## 🏛️ Tech Stack

- **Frontend**: React 18
- **Build Tool**: Webpack
- **Package Manager**: pnpm
- **Containerization**: Docker & Docker Compose

## 🚀 Getting Started

### Step 1: Clone All Repositories

This project consists of separate repositories:

```bash
git clone https://github.com/rgap/mfe-host.git
git clone https://github.com/rgap/mfe-catalog.git
git clone https://github.com/rgap/mfe-cart.git
git clone https://github.com/rgap/mfe-checkout.git
git clone https://github.com/rgap/mfe-playground.git
git clone https://github.com/rgap/mfe-common-components.git
git clone https://github.com/rgap/mfe-common-resources.git
```

The complete project structure should look like:

```
├── .gitignore                   # Git ignore rules
├── docker-compose.yml           # Docker services configuration
├── Dockerfile.shared-libs       # Shared libraries Docker build
├── run-all.sh                   # Local development startup script
├── mfe-host/                    # Main host application
├── mfe-catalog/                 # Remote: Product catalog microfrontend
├── mfe-cart/                    # Remote: Shopping cart microfrontend
├── mfe-checkout/                # Remote: Checkout process microfrontend
├── mfe-playground/              # Development playground
├── mfe-common-components/       # Shared React components
└── mfe-common-resources/        # Shared CSS resources
```

### Step 2: Build All Services

```bash
docker-compose build
```

### Step 3: Run in Background

```bash
docker-compose up -d
```

### Step 4: Access Applications

| Application  | URL                   | Description      |
| ------------ | --------------------- | ---------------- |
| MFE Host     | http://localhost:3000 | Main application |
| MFE Catalog  | http://localhost:3001 | Product catalog  |
| MFE Cart     | http://localhost:3002 | Shopping cart    |
| MFE Checkout | http://localhost:3003 | Checkout         |

## 🐳 Docker Commands

### Basic Operations

```bash
# Build all services
docker-compose build

# Start all services in background
docker-compose up -d

# Start all services with logs
docker-compose up

# Stop all services
docker-compose down

# Restart all services
docker-compose restart
```

## 🔗 Dependencies & Mocking Strategy

Each microfrontend has specific dependencies on other services and shared resources:

### MFE Catalog Dependencies:

- Needs to add products to the shopping cart via `useCart()` hook
- Uses shared UI components (just a Button for now) from `mfe-common-components`

### MFE Cart Dependencies:

- Manages its cart state management via `CartProvider`
- Uses shared UI components (just a Button for now) from `mfe-common-components`
- Exports cart context (`useCart`) for other MFEs to consume

### MFE Checkout Dependencies:

- Needs cart context and directly imports `useCart` from `cart/useCart` to access cart items, update quantities, and remove items
- Renders cart items and manages checkout flow
- Uses shared UI components (just a Button for now) from `mfe-common-components`

### MFE Host Dependencies:

- Lazy loads and orchestrates all microfrontends (`catalog`, `cart`, `checkout`)
- Imports and wraps the cart provider from `cart/CartContext`
- Uses shared UI components (just a Button for now) from `mfe-common-components`
- **Mocks**: Implements error handling to gracefully fallback to mocks when remote MFEs fail
