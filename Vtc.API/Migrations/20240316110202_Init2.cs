using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Vtc.API.Migrations
{
    /// <inheritdoc />
    public partial class Init2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Vehicle_Drivers_DriverId",
                table: "Vehicle");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Vehicle",
                table: "Vehicle");

            migrationBuilder.EnsureSchema(
                name: "DriverManagement");

            migrationBuilder.EnsureSchema(
                name: "TripManagement");

            migrationBuilder.RenameTable(
                name: "Drivers",
                schema: "CustomerManagement",
                newName: "Drivers",
                newSchema: "DriverManagement");

            migrationBuilder.RenameTable(
                name: "Vehicle",
                newName: "Vehicles",
                newSchema: "DriverManagement");

            migrationBuilder.RenameColumn(
                name: "Phone",
                schema: "CustomerManagement",
                table: "Customers",
                newName: "Phone_Number");

            migrationBuilder.RenameIndex(
                name: "IX_Vehicle_DriverId",
                schema: "DriverManagement",
                table: "Vehicles",
                newName: "IX_Vehicles_DriverId");

            migrationBuilder.AddColumn<string>(
                name: "Phone_CountryCode",
                schema: "CustomerManagement",
                table: "Customers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "RegistrationNumber",
                schema: "DriverManagement",
                table: "Vehicles",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Model",
                schema: "DriverManagement",
                table: "Vehicles",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Make",
                schema: "DriverManagement",
                table: "Vehicles",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Color",
                schema: "DriverManagement",
                table: "Vehicles",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<Guid>(
                name: "Id",
                schema: "DriverManagement",
                table: "Vehicles",
                type: "uniqueidentifier",
                nullable: false,
                defaultValueSql: "newsequentialid()",
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Vehicles",
                schema: "DriverManagement",
                table: "Vehicles",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "Trips",
                schema: "TripManagement",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false, defaultValueSql: "newsequentialid()"),
                    DriverId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    VehicleId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    CustomerId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    StartTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EndTime = table.Column<DateTime>(type: "datetime2", nullable: true),
                    EstimatedCost = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    FinalCost = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    Status = table.Column<int>(type: "int", nullable: false),
                    StartLatitude = table.Column<double>(type: "float", nullable: false),
                    StartLongitude = table.Column<double>(type: "float", nullable: false),
                    DestinationLatitude = table.Column<double>(type: "float", nullable: false),
                    DestinationLongitude = table.Column<double>(type: "float", nullable: false),
                    StartingAddress_Street = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    StartingAddress_City = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    StartingAddress_State = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    StartingAddress_Country = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    StartingAddress_PostalCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FinalAddress_Street = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FinalAddress_City = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FinalAddress_State = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FinalAddress_Country = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FinalAddress_PostalCode = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Created = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    LastModified = table.Column<DateTimeOffset>(type: "datetimeoffset", nullable: false),
                    LastModifiedBy = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Trips", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Trips_Customers_CustomerId",
                        column: x => x.CustomerId,
                        principalSchema: "CustomerManagement",
                        principalTable: "Customers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Trips_Drivers_DriverId",
                        column: x => x.DriverId,
                        principalSchema: "DriverManagement",
                        principalTable: "Drivers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Trips_Vehicles_VehicleId",
                        column: x => x.VehicleId,
                        principalSchema: "DriverManagement",
                        principalTable: "Vehicles",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Trips_CustomerId",
                schema: "TripManagement",
                table: "Trips",
                column: "CustomerId");

            migrationBuilder.CreateIndex(
                name: "IX_Trips_DriverId",
                schema: "TripManagement",
                table: "Trips",
                column: "DriverId");

            migrationBuilder.CreateIndex(
                name: "IX_Trips_VehicleId",
                schema: "TripManagement",
                table: "Trips",
                column: "VehicleId");

            migrationBuilder.AddForeignKey(
                name: "FK_Vehicles_Drivers_DriverId",
                schema: "DriverManagement",
                table: "Vehicles",
                column: "DriverId",
                principalSchema: "DriverManagement",
                principalTable: "Drivers",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Vehicles_Drivers_DriverId",
                schema: "DriverManagement",
                table: "Vehicles");

            migrationBuilder.DropTable(
                name: "Trips",
                schema: "TripManagement");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Vehicles",
                schema: "DriverManagement",
                table: "Vehicles");

            migrationBuilder.DropColumn(
                name: "Phone_CountryCode",
                schema: "CustomerManagement",
                table: "Customers");

            migrationBuilder.RenameTable(
                name: "Drivers",
                schema: "DriverManagement",
                newName: "Drivers",
                newSchema: "CustomerManagement");

            migrationBuilder.RenameTable(
                name: "Vehicles",
                schema: "DriverManagement",
                newName: "Vehicle");

            migrationBuilder.RenameColumn(
                name: "Phone_Number",
                schema: "CustomerManagement",
                table: "Customers",
                newName: "Phone");

            migrationBuilder.RenameIndex(
                name: "IX_Vehicles_DriverId",
                table: "Vehicle",
                newName: "IX_Vehicle_DriverId");

            migrationBuilder.AlterColumn<string>(
                name: "RegistrationNumber",
                table: "Vehicle",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Model",
                table: "Vehicle",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Make",
                table: "Vehicle",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Color",
                table: "Vehicle",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<Guid>(
                name: "Id",
                table: "Vehicle",
                type: "uniqueidentifier",
                nullable: false,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldDefaultValueSql: "newsequentialid()");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Vehicle",
                table: "Vehicle",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Vehicle_Drivers_DriverId",
                table: "Vehicle",
                column: "DriverId",
                principalSchema: "CustomerManagement",
                principalTable: "Drivers",
                principalColumn: "Id");
        }
    }
}
