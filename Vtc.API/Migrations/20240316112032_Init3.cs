using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Vtc.API.Migrations
{
    /// <inheritdoc />
    public partial class Init3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DriverLocation_Drivers_DriverId",
                table: "DriverLocation");

            migrationBuilder.DropPrimaryKey(
                name: "PK_DriverLocation",
                table: "DriverLocation");

            migrationBuilder.RenameTable(
                name: "DriverLocation",
                newName: "DriverLocations",
                newSchema: "DriverManagement");

            migrationBuilder.RenameIndex(
                name: "IX_DriverLocation_DriverId",
                schema: "DriverManagement",
                table: "DriverLocations",
                newName: "IX_DriverLocations_DriverId");

            migrationBuilder.AddColumn<DateTime>(
                name: "AdhereAt",
                schema: "CustomerManagement",
                table: "Customers",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AlterColumn<Guid>(
                name: "Id",
                schema: "DriverManagement",
                table: "DriverLocations",
                type: "uniqueidentifier",
                nullable: false,
                defaultValueSql: "newsequentialid()",
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier");

            migrationBuilder.AddPrimaryKey(
                name: "PK_DriverLocations",
                schema: "DriverManagement",
                table: "DriverLocations",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_DriverLocations_Drivers_DriverId",
                schema: "DriverManagement",
                table: "DriverLocations",
                column: "DriverId",
                principalSchema: "DriverManagement",
                principalTable: "Drivers",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_DriverLocations_Drivers_DriverId",
                schema: "DriverManagement",
                table: "DriverLocations");

            migrationBuilder.DropPrimaryKey(
                name: "PK_DriverLocations",
                schema: "DriverManagement",
                table: "DriverLocations");

            migrationBuilder.DropColumn(
                name: "AdhereAt",
                schema: "CustomerManagement",
                table: "Customers");

            migrationBuilder.RenameTable(
                name: "DriverLocations",
                schema: "DriverManagement",
                newName: "DriverLocation");

            migrationBuilder.RenameIndex(
                name: "IX_DriverLocations_DriverId",
                table: "DriverLocation",
                newName: "IX_DriverLocation_DriverId");

            migrationBuilder.AlterColumn<Guid>(
                name: "Id",
                table: "DriverLocation",
                type: "uniqueidentifier",
                nullable: false,
                oldClrType: typeof(Guid),
                oldType: "uniqueidentifier",
                oldDefaultValueSql: "newsequentialid()");

            migrationBuilder.AddPrimaryKey(
                name: "PK_DriverLocation",
                table: "DriverLocation",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_DriverLocation_Drivers_DriverId",
                table: "DriverLocation",
                column: "DriverId",
                principalSchema: "DriverManagement",
                principalTable: "Drivers",
                principalColumn: "Id");
        }
    }
}
