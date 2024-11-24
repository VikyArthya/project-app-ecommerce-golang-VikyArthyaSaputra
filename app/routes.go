package app

import (
	"net/http"

	"github.com/VikyArthya/project-app-ecommerce-golang-VikyArthyaSaputra/app/controllers"
	"github.com/VikyArthya/project-app-ecommerce-golang-VikyArthyaSaputra/app/repositories"
	"github.com/gorilla/mux"
)

func (server *Server) InitializeRoutes() {
	// Inisialisasi router
	server.Router = mux.NewRouter()

	// Route untuk halaman utama
	server.Router.HandleFunc("/", controllers.Home).Methods("GET")

	// Route untuk file statis
	staticFileDirectory := http.Dir("./assets/")
	staticFileHandler := http.StripPrefix("/public/", http.FileServer(staticFileDirectory))
	server.Router.PathPrefix("/public/").Handler(staticFileHandler).Methods("GET")

	// Repository dan Controller
	userRepo := repositories.UserRepository{DB: server.DB}
	userController := controllers.UserController{Repo: &userRepo}

	productRepo := repositories.ProductRepository{DB: server.DB}
	productController := controllers.ProductController{Repo: &productRepo}

	// Routes untuk User
	server.Router.HandleFunc("/users", userController.GetUsers).Methods("GET")           // Get All Users
	server.Router.HandleFunc("/users", userController.CreateUser).Methods("POST")        // Create User
	server.Router.HandleFunc("/users/{id}", userController.GetUserByID).Methods("GET")   // Get User by ID
	server.Router.HandleFunc("/users/{id}", userController.UpdateUser).Methods("PUT")    // Update User by ID
	server.Router.HandleFunc("/users/{id}", userController.DeleteUser).Methods("DELETE") // Delete User by ID

	// Routes untuk Product
	server.Router.HandleFunc("/products", productController.GetProducts).Methods("GET")           // Get All Products
	server.Router.HandleFunc("/products", productController.CreateProduct).Methods("POST")        // Create Product
	server.Router.HandleFunc("/products/{id}", productController.GetProductByID).Methods("GET")   // Get Product by ID
	server.Router.HandleFunc("/products/{id}", productController.UpdateProduct).Methods("PUT")    // Update Product by ID
	server.Router.HandleFunc("/products/{id}", productController.DeleteProduct).Methods("DELETE") // Delete Product by ID
}
