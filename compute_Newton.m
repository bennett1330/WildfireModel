function dT = compute_Newton(Tnew, indM, indN, k, dt)

    dT = 0;
    dT = dT - k * ( Tnew(indM, indN) - Tnew(indM - 1, indN - 1) );
    dT = dT - k * ( Tnew(indM, indN) - Tnew(indM - 1, indN) );
    dT = dT - k * ( Tnew(indM, indN) - Tnew(indM - 1, indN + 1) );
    dT = dT - k * ( Tnew(indM, indN) - Tnew(indM, indN - 1) );
    dT = dT - k * ( Tnew(indM, indN) - Tnew(indM, indN + 1) );
    dT = dT - k * ( Tnew(indM, indN) - Tnew(indM + 1, indN - 1) );
    dT = dT - k * ( Tnew(indM, indN) - Tnew(indM + 1, indN) );
    dT = dT - k * ( Tnew(indM, indN) - Tnew(indM + 1,indN + 1) );
    dT = dT/8 * dt;

