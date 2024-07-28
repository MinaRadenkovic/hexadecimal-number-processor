#autor: Mina Radenković INDEX SV76-2022
#domaci iz arhitekture racunara

.section .text
.globl poredjenjeBrojeva

    #int poredjenjeBrojeva(unsigned int v1, unsigned int v2)
    # prvi parametar v1
    # drugi parametar v2

poredjenjeBrojeva: 	pushl %ebp #cuvanje zatecenog pokazivaca frejma
    			movl %esp, %ebp #postavljanje novog pokazivaca frejma

    pushl %ebx
    pushl %esi
    pushl %edi #cuvanje sadrzaja registara ebx, esi, edi

    movl $0, %ebx #broj je zadat u 32-bitnom obliku?
    #ebx sluzi za proveru koliko bita smo "prosli"

    #brojaci za 0
    movl $0, %esi #pretpostavimo da uneti broj nema 0
    movl $0, %edi #esi za parametar v1, edi za parametar v2

    movl $1, %eax #maska 0x0001

    movl 8(%ebp), %ecx #promenljiva v1
    movl 12(%ebp), %edx #promenljiva v2
    #prvi parametar v1  8(%ebp)
    #drugi parametar v2  12(%ebp)

br1: 	cmpl $32, %ebx #broj je 32-bitni i uporedjujemo da li smo prosli kroz sve bite
    	je br2 #ako jesmo prelazimo na drugi broj
    	testl %ecx, %eax #logicka operacija i ali samo za flagove
    	jz povecaj1
    	shrl $1, %ecx #dobijamo 'novi' broj
    	incl %ebx #prelazimo na novi bit broja
    	jmp br1

povecaj1: 	incl %esi #nasli 0
    		shrl $1, %ecx #dobijamo 'novi' broj
    		incl %ebx #novi bit broja
    		jmp br1

br2: 	cmpl $0, %ebx
    	je uporedi
    	testl %edx, %eax
    	jz povecaj2
    	shrl $1, %edx
    	decl %ebx
    	jmp br2

povecaj2: 	incl %edi
    		shrl $1, %edx
    		decl %ebx
    		jmp br2

uporedi: 	movl $2, %ebx
    		xorl %edx, %edx
    		movl %esi, %eax
    		divl %ebx
    		movl %edx, %ecx

    movl %edi, %eax
    xorl %edx, %edx
    divl %ebx

    cmpl %ecx, %edx
    je i
    jne ili

i: #ako je ostatak pri deljenju sa 2 jednak nuli
    movl 8(%ebp), %ecx #promenljiva v1
    movl 12(%ebp), %edx #promenljiva v2
    andl %ecx, %edx
    movl %edx, %eax
    jmp kraj_potprograma

ili: #ako je ostatak pri deljenju sa 2 jednak jedinici
    movl 8(%ebp), %ecx #promenljiva v1
    movl 12(%ebp), %edx #promenljiva v2
    orl %ecx, %edx
    movl %edx, %eax
    jmp kraj_potprograma

kraj_potprograma: 	popl %edi
    			popl %esi
    			popl %ebx
    			movl %ebp, %esp #brisanje lokalnih promenljivih
    			popl %ebp #vracanje prethodnog pokazivaca frejma
    			ret
