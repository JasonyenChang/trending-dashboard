import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import { pool } from "./db.js";

dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());

app.get("/api/trending-products", async (req, res) => {
    try {
        const result = await pool.query("SELECT * FROM products ORDER BY sales DESC LIMIT 10");
        res.json(result.rows);
    } catch (error) {
        console.error("Database error:", error);
        res.status(500).json({ error: "trending-products query failed" });
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
