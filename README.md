# Microfrontend Multirepo Demo

## 🏗️ Architecture Overview

This project implements a Microfrontend (MFE) Multirepository Architecture using React only, where each application can be developed, deployed, and maintained independently.

### Applications Structure

```
├── mfe-host/                    # Shell/Host application (Port 3000)
├── mfe-catalog/                 # Product catalog microfrontend (Port 3001)
├── mfe-cart/                    # Shopping cart microfrontend (Port 3002)
├── mfe-checkout/                # Checkout process microfrontend (Port 3003)
├── mfe-common-components/       # Shared React components library
├── mfe-common-resources/        # Shared CSS resources
├── mfe-playground/              # Development playground environment
```

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
