    /*
     * Some or all of this work - Copyright (c) 2006 - 2018, Intel Corp.
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without modification,
     * are permitted provided that the following conditions are met:
     *
     * Redistributions of source code must retain the above copyright notice,
     * this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above copyright notice,
     * this list of conditions and the following disclaimer in the documentation
     * and/or other materials provided with the distribution.
     * Neither the name of Intel Corporation nor the names of its contributors
     * may be used to endorse or promote products derived from this software
     * without specific prior written permission.
     *
     * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
     * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
     * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
     * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
     * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
     * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
     * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
     * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
     * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
     * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     */
    /*
     * Bug 0101:
     *
     * SUMMARY: The ASL compiler fails to create RefOf reference to Method not returning explicitly any object
     */
    /* //////// */
    Method (ME5E, 0, NotSerialized)
    {
    }

    Method (ME5F, 0, NotSerialized)
    {
        Local0 = RefOf (ME5E)
        Debug = ObjectType (Local0)
        Local1 = ObjectType (Local0)
        If ((Local1 != C010))
        {
            ERR ("", ZFFF, 0x2F, 0x00, 0x00, Local1, C010)
        }

        Return (0x00)
    }

    /* //////// */

    Method (ME60, 0, NotSerialized)
    {
        Return (0x01)
    }

    Method (ME61, 0, NotSerialized)
    {
        Debug = "Start of test"
        Local0 = RefOf (ME60)
        Debug = "ObjectType(Local0):"
        Local1 = ObjectType (Local0)
        Debug = Local1
        If ((Local1 != C010))
        {
            ERR ("", ZFFF, 0x46, 0x00, 0x00, Local1, C010)
        }

        Debug = "Finish of test"
        Return (0x00)
    }

    Method (ME62, 0, NotSerialized)
    {
        ME5F ()
        ME61 ()
    }
