package app

import "github.com/VikyArthya/project-app-ecommerce-golang-VikyArthyaSaputra/app/models"

type Model struct {
	Model interface{}
}

func RegisterModels() []Model {
	return []Model{
		{Model: models.User{}},
		{Model: models.Address{}},
		{Model: models.Product{}},
		{Model: models.ProductImage{}},
		{Model: models.Category{}},
		{Model: models.Section{}},
		{Model: models.Order{}},
		{Model: models.OrderItem{}},
		{Model: models.OrderCustomer{}},
		{Model: models.Payment{}},
		{Model: models.Shipment{}},
	}
}
