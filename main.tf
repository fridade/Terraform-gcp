module "cloudsql" {
    source = "./cloudsql"
}

module "s3bucket" {
    source = "./s3bucket"
}

module "cloudrun" {
    source = "./cloudrun"
}