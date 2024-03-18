using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Vtc.API.Migrations
{
    /// <inheritdoc />
    public partial class Init4 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PhoneNumber_CountryCode",
                schema: "CustomerManagement",
                table: "OtpValidations");

            migrationBuilder.RenameColumn(
                name: "PhoneNumber_Number",
                schema: "CustomerManagement",
                table: "OtpValidations",
                newName: "PhoneNumber");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "PhoneNumber",
                schema: "CustomerManagement",
                table: "OtpValidations",
                newName: "PhoneNumber_Number");

            migrationBuilder.AddColumn<string>(
                name: "PhoneNumber_CountryCode",
                schema: "CustomerManagement",
                table: "OtpValidations",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
