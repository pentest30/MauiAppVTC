using VtcSolution.Application;
using VtcSolution.Infrastructure;
using VtcSolution.Infrastructure.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddApplicationServices();
var assembly = typeof(Program).Assembly;
builder.Services.AddInfrastructureServices(builder.Configuration, assembly.GetName().Name);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();
app.MigrateDatabase<ApplicationDbContext>();
app.InitialiseDatabaseAsync().GetAwaiter().GetResult();

app.Run();
