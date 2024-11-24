package controllers

import (
	"encoding/json"
	"net/http"

	"github.com/VikyArthya/project-app-ecommerce-golang-VikyArthyaSaputra/app/models"
	"github.com/VikyArthya/project-app-ecommerce-golang-VikyArthyaSaputra/app/repositories"
	"github.com/gorilla/mux"
)

type ProductController struct {
	Repo *repositories.ProductRepository
}

func (c *ProductController) GetProducts(w http.ResponseWriter, r *http.Request) {
	products, err := c.Repo.GetProducts()
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(products)
}

func (c *ProductController) CreateProduct(w http.ResponseWriter, r *http.Request) {
	var product models.Product
	if err := json.NewDecoder(r.Body).Decode(&product); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	if err := c.Repo.CreateProduct(&product); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(product)
}

func (c *ProductController) GetProductByID(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id := vars["id"]

	product, err := c.Repo.GetProductByID(id)
	if err != nil {
		http.Error(w, "Product not found", http.StatusNotFound)
		return
	}
	json.NewEncoder(w).Encode(product)
}

func (c *ProductController) UpdateProduct(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id := vars["id"]

	var product models.Product
	if err := json.NewDecoder(r.Body).Decode(&product); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	product.ID = id
	if err := c.Repo.UpdateProduct(&product); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	json.NewEncoder(w).Encode(product)
}

func (c *ProductController) DeleteProduct(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id := vars["id"]

	if err := c.Repo.DeleteProduct(id); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.WriteHeader(http.StatusNoContent)
}
