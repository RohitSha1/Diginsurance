import mongoose from "mongoose"
import JWT from "jsonwebtoken"
import dotenv from "dotenv"
dotenv.config()

let adminSchema = new mongoose.Schema(
	{
		email: {
			type: String,
			unique: true,
		},
		role: String,
		name:String,
		password:String,
		image: String,
		access: Boolean,
		qualification: String,
		department: String,
		experience: String,
		expertise: String,

	},
	{ timestamps: true }
)

adminSchema.methods.generateAuthToken = (admin) => {
	const token = JWT.sign(
		{ _id: admin._id, role: "admin" },
		process.env.JWT_KEY,
		{
			expiresIn: "7d",
		}
	)
	return token
}


const Admin = mongoose.model("admin", adminSchema)

export default Admin