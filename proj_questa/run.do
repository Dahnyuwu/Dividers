transcript on

if {[file exists work]} {
vdel -lib work -all
}

vlib work
vmap work work

# Compilación
vlog -sv ../src/*.sv

# Simulación
vsim -voptargs=+acc work.tb_divider


# Corre toda la simulación
run -all