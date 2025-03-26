# Domain Separation

In this repository, we follow an organizational structure that separates different models for better code modularity and maintainability.

## Folder Structure

Each model is located in a separate folder, following the naming and organization convention:

domain/
├── model/
└── infrastructure/
  ├── mappers/
  ├── repository/
  └── service/


## Folder Description

- **model/**: Contains the definition of the model itself.
- **infrastructure/**: Contains infrastructure related to the model, such as mappers, repositories, and services.
    - **mappers/**: Contains functions or classes for mapping data between the model and other representations.
    - **repository/**: Contains logic for interacting with the data storage layer.
    - **service/**: Contains model-specific business logic, such as functions or classes for performing operations related to the model.

## Advantages of This Structure

- **Modularity**: Each model is encapsulated in its own folder, making it easier to understand and maintain.
- **Reusability**: Infrastructure components, such as mappers and repositories, can be shared between models if necessary.
- **Clarity**: Separation of responsibilities makes it easier to understand what each part of the code does and where to find it.

This structure helps us maintain organized and scalable code as we add more models or functionalities to the project.