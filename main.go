package main

import "github.com/gofiber/fiber/v2"

func main() {
    app := fiber.New()

    app.Get("/", func(c *fiber.Ctx) error {
		// fiberhelloworld
        return c.Status(200).JSON(fiber.Map{"success": true,"message":"FiberHelloWorld, World 👋!"})
    })

    app.Listen(":8080")
}