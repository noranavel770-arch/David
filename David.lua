-- SCRIPT PARA DELTA EXECUTOR - PANEL DE COMPRA VIP
-- CONFIGURACIÓN
local CONFIG = {
    NOMBRE_MONEDA = "Robux",
    MONEDA_INICIAL = 5875,
    PRECIO_VIP = 85,
    ID_IMAGEN_VIP = "rbxassetid://TU_ID_DE_IMAGEN_AQUI" -- Reemplaza con el ID de tu imagen
}

-- INICIALIZACIÓN DE DATOS DEL JUGADOR
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local datosJugador = Instance.new("Folder")
datosJugador.Name = "DatosJugador"
datosJugador.Parent = player

local monedas = Instance.new("IntValue")
monedas.Name = CONFIG.NOMBRE_MONEDA
monedas.Value = CONFIG.MONEDA_INICIAL
monedas.Parent = datosJugador

-- CREAR GUI PRINCIPAL
local gui = Instance.new("ScreenGui")
gui.Name = "PanelCompraVIP"
gui.Parent = player.PlayerGui

-- CONTENEDOR DE MONEDAS (SUPERIOR DERECHA)
local contenedorMonedas = Instance.new("Frame")
contenedorMonedas.Size = UDim2.new(0, 180, 0, 50)
contenedorMonedas.Position = UDim2.new(1, -190, 0, 10)
contenedorMonedas.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
contenedorMonedas.BorderColor3 = Color3.new(0.4, 0.4, 0.4)
contenedorMonedas.Parent = gui

local iconoMoneda = Instance.new("ImageLabel")
iconoMoneda.Size = UDim2.new(0, 35, 0, 35)
iconoMoneda.Position = UDim2.new(0, 7, 0, 7)
iconoMoneda.Image = "rbxassetid://1070099777" -- Icono de moneda
iconoMoneda.BackgroundTransparency = 1
iconoMoneda.Parent = contenedorMonedas

local textoMonedas = Instance.new("TextLabel")
textoMonedas.Size = UDim2.new(0, 130, 0, 50)
textoMonedas.Position = UDim2.new(0, 45, 0, 0)
textoMonedas.Text = CONFIG.NOMBRE_MONEDA .. ": " .. monedas.Value
textoMonedas.TextSize = 22
textoMonedas.Font = Enum.Font.SourceSansBold
textoMonedas.TextColor3 = Color3.new(1, 1, 1)
textoMonedas.BackgroundTransparency = 1
textoMonedas.Parent = contenedorMonedas

-- ACTUALIZAR TEXTO DE MONEDAS
monedas.Changed:Connect(function()
    textoMonedas.Text = CONFIG.NOMBRE_MONEDA .. ": " .. monedas.Value
end)

-- PANEL DE COMPRA VIP
local panelCompra = Instance.new("Frame")
panelCompra.Size = UDim2.new(0, 550, 0, 380)
panelCompra.Position = UDim2.new(0.5, -275, 0.5, -190)
panelCompra.BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
panelCompra.BorderColor3 = Color3.new(0.6, 0.4, 0.1)
panelCompra.Visible = false
panelCompra.Parent = gui

-- TÍTULO DEL PANEL
local tituloPanel = Instance.new("TextLabel")
tituloPanel.Size = UDim2.new(1, 0, 0, 40)
tituloPanel.Text = "COMPRA PAQUETE VIP"
tituloPanel.TextSize = 24
tituloPanel.Font = Enum.Font.SourceSansBold
tituloPanel.TextColor3 = Color3.new(1, 1, 1)
tituloPanel.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
tituloPanel.Parent = panelCompra

-- IMAGEN VIP
local imagenVIP = Instance.new("ImageLabel")
imagenVIP.Size = UDim2.new(0, 480, 0, 220)
imagenVIP.Position = UDim2.new(0, 35, 0, 50)
imagenVIP.Image = CONFIG.ID_IMAGEN_VIP -- REEMPLAZA AQUÍ TU ID DE IMAGEN
imagenVIP.BackgroundTransparency = 1
imagenVIP.ScaleType = Enum.ScaleType.Fit
imagenVIP.Parent = panelCompra

-- TEXTO DE PRECIO
local textoPrecio = Instance.new("TextLabel")
textoPrecio.Size = UDim2.new(1, 0, 0, 35)
textoPrecio.Position = UDim2.new(0, 0, 0, 280)
textoPrecio.Text = "PRECIO: " .. CONFIG.PRECIO_VIP .. " " .. CONFIG.NOMBRE_MONEDA
textoPrecio.TextSize = 20
textoPrecio.TextColor3 = Color3.new(1, 1, 1)
textoPrecio.BackgroundTransparency = 1
textoPrecio.Parent = panelCompra

-- BOTÓN DE COMPRA
local botonComprar = Instance.new("TextButton")
botonComprar.Size = UDim2.new(0, 250, 0, 50)
botonComprar.Position = UDim2.new(0.5, -125, 0, 320)
botonComprar.Text = "COMPRAR AHORA"
botonComprar.TextSize = 20
botonComprar.Font = Enum.Font.SourceSansBold
botonComprar.BackgroundColor3 = Color3.new(0.1, 0.6, 0.2)
botonComprar.TextColor3 = Color3.new(1, 1, 1)
botonComprar.Parent = panelCompra

-- BOTÓN DE CERRAR
local botonCerrar = Instance.new("TextButton")
botonCerrar.Size = UDim2.new(0, 40, 0, 40)
botonCerrar.Position = UDim2.new(1, -45, 0, 5)
botonCerrar.Text = "X"
botonCerrar.TextSize = 20
botonCerrar.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
botonCerrar.TextColor3 = Color3.new(1, 1, 1)
botonCerrar.Parent = panelCompra

-- FUNCIÓN PARA ABRIR EL PANEL
local function abrirPanel()
    panelCompra.Visible = true
end

-- FUNCIÓN DE COMPRA
botonComprar.MouseButton1Click:Connect(function()
    if monedas.Value >= CONFIG.PRECIO_VIP then
        monedas.Value = monedas.Value - CONFIG.PRECIO_VIP
        
        -- APLICAR BENEFICIOS DEL VIP
        local esVIP = Instance.new("BoolValue")
        esVIP.Name = "EsVIP"
        esVIP.Value = true
        esVIP.Parent = player
        
        -- MENSAJE DE ÉXITO
        textoPrecio.Text = "¡COMPRA EXITOSA! BENEFICIOS ACTIVADOS"
        textoPrecio.TextColor3 = Color3.new(0.2, 1, 0.2)
    else
        textoPrecio.Text = "FONDOS INSUFICIENTES - NECESITAS " .. CONFIG.PRECIO_VIP .. " " .. CONFIG.NOMBRE_MONEDA
        textoPrecio.TextColor3 = Color3.new(1, 0.2, 0.2)
    end
end)

-- BOTÓN CERRAR
botonCerrar.MouseButton1Click:Connect(function()
    panelCompra.Visible = false
end)

-- ABRIR PANEL CON TECLA (EJ: TECLA "C")
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.C then
        abrirPanel()
    end
end)
