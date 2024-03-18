using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Vtc.API.Migrations
{
    /// <inheritdoc />
    public partial class Init5 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_OtpValidations_Customers_CustomerId",
                schema: "CustomerManagement",
                table: "OtpValidations");

            migrationBuilder.DropForeignKey(
                name: "FK_OtpValidations_Drivers_DriverId",
                schema: "CustomerManagement",
                table: "OtpValidations");

            migrationBuilder.AddForeignKey(
                name: "FK_OtpValidations_Customers_CustomerId",
                schema: "CustomerManagement",
                table: "OtpValidations",
                column: "CustomerId",
                principalSchema: "CustomerManagement",
                principalTable: "Customers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_OtpValidations_Drivers_DriverId",
                schema: "CustomerManagement",
                table: "OtpValidations",
                column: "DriverId",
                principalSchema: "DriverManagement",
                principalTable: "Drivers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_OtpValidations_Customers_CustomerId",
                schema: "CustomerManagement",
                table: "OtpValidations");

            migrationBuilder.DropForeignKey(
                name: "FK_OtpValidations_Drivers_DriverId",
                schema: "CustomerManagement",
                table: "OtpValidations");

            migrationBuilder.AddForeignKey(
                name: "FK_OtpValidations_Customers_CustomerId",
                schema: "CustomerManagement",
                table: "OtpValidations",
                column: "CustomerId",
                principalSchema: "CustomerManagement",
                principalTable: "Customers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_OtpValidations_Drivers_DriverId",
                schema: "CustomerManagement",
                table: "OtpValidations",
                column: "DriverId",
                principalSchema: "DriverManagement",
                principalTable: "Drivers",
                principalColumn: "Id");
        }
    }
}
