#__precompile__(true)

module UnsteadyFlowSolvers

import Dierckx: Spline1D, derivative, evaluate

import ForwardDiff

import DelimitedFiles

import Serialization

import NLsolve: nlsolve, not_in_place

import Statistics: mean

import PyPlot: plot, scatter, figure, xlabel, ylabel, xlim, ylim,
    xticks, yticks, subplot, subplot2grid, legend, axis, savefig,
    close, tight_layout

import Plots: @layout

import LaTeXStrings: @L_str

#For use in development and debugging
import Revise

using Printf
export
    # kinematics types and funtions
    MotionDef,
    KinemPar,
    KinemDef,
    EldUpDef,
    EldUptstartDef,
    ConstDef,
    EldRampReturnDef,
    EldUpIntDef,
    EldUpInttstartDef,
    SinDef,
    CosDef,

    # 2D low-order solver types
    TwoDSurf,
    TwoDOFPar,
    KinemPar2DOF,
    TwoDVort,
    TwoDFlowField,
    KelvinCondition,
    KelvinKutta,
    TwoDSurfThick,

    # vortex count control utility
    delVortDef,
    delNone,
    delSpalart,

    # utility functions
    simpleTrapz,
    camber_calc,
    find_tstep,
    simpleInterp,
    cleanWrite,
    getEndCycle,

    # 2D low-order solver methods
    lautat,
    ldvm,
    ldvmLin,
    ldvm2DOF,

    # 2D plot output functions
    makeForcePlots2D,
    makeVortPlots2D,

    # 2D postprocessing functions
    calc_edgeVel

### source files

# kinematic types
include("kinem.jl")

# utility functions
include("utils.jl")

# vortex count control utility
include("delVort.jl")

# low-order 2D thin solvers
include("thin2D/typedefs.jl")            # type definitions
include("thin2D/calcs.jl")               # calculation functions
include("thin2D/solvers.jl")             # solver methods
include("thin2D/postprocess.jl")         # postprocessing functions

# low-order 2D thick solvers
include("thick2D/typedefs.jl")            # type definitions
include("thick2D/calcs.jl")               # calculation functions
include("thick2D/solvers.jl")             # solver methods
include("thick2D/postprocess.jl")         # postprocessing functions


# 2D plotting functions
include("plots/plots2D.jl")

# IBL coupled functions
include("sr2/IBLCoupled.jl")
include("sr2/IBLFV.jl")
include("sr2/correlate.jl")

end
