FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS BUILDER
COPY . /app
WORKDIR /app
RUN dotnet build mHS.NEEV.API.csproj
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/runtime:2.2

COPY --from=BUILDER /app /app
ENTRYPOINT ["dotnet", "app/out/bin/mHS.NEEV.API.dll"]

