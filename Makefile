ifneq ($(KERNELRELEASE),)
	obj-m := kmalloc.o
else
	KERNELDIR ?= /usr/lib/modules/$(shell uname -r)/build
	PWD := $(shell pwd)
default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
endif

.PHONY: clean
clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean
	-rm *.mod.c *.o *.order *.symvers *.ko

