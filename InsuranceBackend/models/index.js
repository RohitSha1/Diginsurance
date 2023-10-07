import mongoose from "mongoose"
import dotenv from "dotenv"
dotenv.config()

export default	 mongoose.connect(`mongodb://0.0.0.0:27017/ISAVE`, (err) => {
	if (err) {
		console.log(err.message)
		console.log("error connecting MongoDB")
	} else {
		console.log("Connected to MongoDB")
	}
})
