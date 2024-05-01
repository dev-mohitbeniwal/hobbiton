package main

import "github.com/gin-gonic/gin"

func main() {
	// Create a gin router
	router := gin.Default()

	// Define a GET request route
	router.GET("/hello", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "Hello World!",
		})
	})

	// Run the server on port 8080
	router.Run()
}
