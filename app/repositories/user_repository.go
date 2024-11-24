package repositories

import (
	"github.com/VikyArthya/project-app-ecommerce-golang-VikyArthyaSaputra/app/models"
	"gorm.io/gorm"
)

type UserRepository struct {
	DB *gorm.DB
}

func (r *UserRepository) CreateUser(user *models.User) error {
	return r.DB.Create(user).Error
}

func (r *UserRepository) GetUsers() ([]models.User, error) {
	var users []models.User
	err := r.DB.Preload("Addresses").Find(&users).Error
	return users, err
}

func (r *UserRepository) GetUserByID(id string) (*models.User, error) {
	var user models.User
	err := r.DB.Preload("Addresses").First(&user, "id = ?", id).Error
	return &user, err
}

func (r *UserRepository) UpdateUser(user *models.User) error {
	return r.DB.Save(user).Error
}

func (r *UserRepository) DeleteUser(id string) error {
	return r.DB.Delete(&models.User{}, "id = ?", id).Error
}
