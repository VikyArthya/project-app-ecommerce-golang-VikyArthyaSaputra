package repositories

import (
	"github.com/VikyArthya/project-app-ecommerce-golang-VikyArthyaSaputra/app/models"
	"gorm.io/gorm"
)

type ProductRepository struct {
	DB *gorm.DB
}

func (r *ProductRepository) CreateProduct(product *models.Product) error {
	return r.DB.Create(product).Error
}

func (r *ProductRepository) GetProducts() ([]models.Product, error) {
	var products []models.Product
	err := r.DB.Preload("User").Preload("Categories").Find(&products).Error
	return products, err
}

func (r *ProductRepository) GetProductByID(id string) (*models.Product, error) {
	var product models.Product
	err := r.DB.Preload("User").Preload("Categories").First(&product, "id = ?", id).Error
	return &product, err
}

func (r *ProductRepository) UpdateProduct(product *models.Product) error {
	return r.DB.Save(product).Error
}

func (r *ProductRepository) DeleteProduct(id string) error {
	return r.DB.Delete(&models.Product{}, "id = ?", id).Error
}
