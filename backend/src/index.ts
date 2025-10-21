import express from "express";
import cors from "cors";
import dotenv from "dotenv";

dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());

app.get("/api/trending-products", (req, res) => {
    res.json([
        { id: 1, name: "Oversized Jacket", category: "Men", sales: 512, growth: 32, stock: "normal" },
        { id: 2, name: "Retro Sneakers", category: "Unisex", sales: 430, growth: 18, stock: "low" },
        { id: 3, name: "Leather Bag", category: "Women", sales: 398, growth: -5, stock: "normal" },
    ]);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
