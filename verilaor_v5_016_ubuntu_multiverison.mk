.PHONY:
verilator_bin_path = /home/zp001/verilator/v5_016/bin
set:
	update-alternatives --install /usr/bin/verilator verilator $(verilator_bin_path)/verilator 100 \
    	--slave /usr/bin/verilator_bin verilator_bin $(verilator_bin_path)/verilator_bin \
    	--slave /usr/bin/verilator_bin_dbg verilator_bin_dbg $(verilator_bin_path)/verilator_bin_dbg \
		--slave /usr/bin/verilator_coverage verilator_coverage $(verilator_bin_path)/verilator_coverage \
    	--slave /usr/bin/verilator_coverage_bin_dbg verilator_coverage_bin_dbg $(verilator_bin_path)/verilator_coverage_bin_dbg \
    	--slave /usr/bin/verilator_gantt verilator_gantt $(verilator_bin_path)/verilator_gantt \
    	--slave /usr/bin/verilator_profcfunc verilator_profcfunc $(verilator_bin_path)/verilator_profcfunc

display:
	update-alternatives --display verilator

unset:
	update-alternatives --remove verilator $(verilator_bin_path)/verilator
