import { Application } from "stimulus"
import PasswordController from '../controllers/patient_password_controller.js';
import '../src/mobile.scss'

require.context('images', true)

const application = Application.start()
application.register("patient-password", PasswordController)
