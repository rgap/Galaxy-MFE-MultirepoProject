# Microfrontend Multirepo Demo

A proof of concept (POC) demonstrating microfrontend architecture using Module Federation in a multi-repository setup.

## Architecture

This project consists of 3 separate repositories:

1. [Host Application](https://github.com/rgap/Galaxy-MicroFrontEnds-Multirepo-Host)

   - Main shell application that loads and coordinates the microfrontends

2. [Catalog Microfrontend](https://github.com/rgap/Galaxy-MicroFrontEnds-Multirepo-Catalog)

   - Product catalog functionality

3. [Cart Microfrontend](https://github.com/rgap/Galaxy-MicroFrontEnds-Multirepo-Cart)
   - Shopping cart functionality

## Key Features

- Module Federation for runtime dependency sharing
- Independent deployment of microfrontends
- Single Page Application (SPA) architecture
- Clean separation of concerns across repos

## Getting Started

1. Clone each repository:

```bash
git clone https://github.com/rgap/Galaxy-MicroFrontEnds-Multirepo-Host
git clone https://github.com/rgap/Galaxy-MicroFrontEnds-Multirepo-Catalog
git clone https://github.com/rgap/Galaxy-MicroFrontEnds-Multirepo-Cart
```

2. Follow the setup instructions in each repository's README to run the applications locally.
