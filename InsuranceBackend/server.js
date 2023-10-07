import express, { json, urlencoded } from "express"
import cors from "cors"
import connect from "./models/index.js"
import userRoutes from "./routes/userRoutes.js"
import doctorRoutes from "./routes/doctorRoutes.js"
import departmentRoutes from "./routes/departmentRoutes.js"
import appointmentRoutes from "./routes/appointmentRoutes.js"
import adminRoutes from "./routes/adminRoutes.js"
import paymentRoutes from "./routes/paymentRoutes.js"
import prescriptionRoutes from "./routes/prescriptionRoutes.js"
import chartRoutes from "./routes/chartRoutes.js"
import dotenv from "dotenv"
dotenv.config()
import path from "path"
import morgan from "morgan"
import { fileURLToPath } from "url"
import { Console } from "console"
import { Server } from "http"
const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)


connect
const app = express()
const port = 4000

//middlewares
app.use(cors())
app.use(express.static(path.join(__dirname, "build")))
app.use(morgan("dev"))

app.use(json())
app.use(urlencoded({ extended: false }))

//routes
app.use("/api/user", userRoutes)
app.use("/api/doctor", doctorRoutes)
app.use("/api/department", departmentRoutes)
app.use("/api/appointment", appointmentRoutes)
app.use("/api/admin", adminRoutes)
app.use("/api/payment", paymentRoutes)
app.use("/api/prescription", prescriptionRoutes)
app.use("/api/chart", chartRoutes)

app.use(express.static(path.join(__dirname, "build")))
app.get("/*", (req, res) => {
	res.sendFile(path.join(__dirname, "build", "index.html"))
})

app.use((err, req, res, next) => {
	res.status(500).json({ status: "fail", message: err.message })
})

app.listen(port, (err) => {
	if (err) {
		console.log("error creating server")
	} else {
		console.log(port)
		console.log(`Listening at http://localhost:${port}`)
	}
})

export default Server


